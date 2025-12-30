#python3 generate_problems.py 50 --level ext1 --seed 7

import argparse
import math
import random
from dataclasses import dataclass
from pathlib import Path
from typing import Optional


@dataclass(frozen=True)
class Instance:
    level: str
    size: int
    days: int
    rooms: int
    seed: Optional[int]


def _day_name(d: int) -> str:
    return f"d{d}"


def _room_name(i: int) -> str:
    return f"h{i}"


def _res_name(i: int) -> str:
    return f"r{i}"


def _choose_duration(rng: random.Random, max_d: int) -> int:
    # Small durations keep files compact and FF happy.
    return rng.randint(1, min(5, max_d))


def generate_problem_text(inst: Instance) -> str:
    rng = random.Random(inst.seed)

    level = inst.level.lower()
    if level not in {"basic", "ext1", "ext3"}:
        raise ValueError("level must be one of: basic, ext1, ext3")

    domain = {
        "basic": "reserves-hotel-basic",
        "ext1": "reserves-hotel-ext1",
        "ext3": "reserves-hotel-ext3",
    }[level]

    problem_name = f"reserves-hotel-{level}-auto-{inst.size}"

    # Create rooms.
    room_caps: list[int] = []
    for _ in range(inst.rooms):
        room_caps.append(rng.randint(1, 4))
    if room_caps:
        room_caps[0] = 4  # guarantee at least one large room

    # Create reservations.
    res_people: list[int] = [rng.randint(1, 4) for _ in range(inst.size)]

    # Ensure every reservation fits somewhere (bump a room if needed).
    max_people = max(res_people) if res_people else 1
    if room_caps and max(room_caps) < max_people:
        room_caps[0] = max_people

    # Generate time windows and dia-reserva facts.
    # Convention: [start, end) (end day is NOT occupied).
    dia_facts: list[tuple[int, int]] = []  # (res_index, day)
    for i in range(inst.size):
        start = rng.randint(1, inst.days)  # inclusive
        max_duration = inst.days - start + 1
        duration = _choose_duration(rng, max_duration)
        end = start + duration  # exclusive
        for d in range(start, min(end, inst.days + 1)):
            dia_facts.append((i + 1, d))

    lines: list[str] = []
    lines.append(f"(define (problem {problem_name})")
    lines.append(f"  (:domain {domain})")
    lines.append("")

    # Objects.
    room_objs = " ".join(_room_name(i + 1) for i in range(inst.rooms))
    res_objs = " ".join(_res_name(i + 1) for i in range(inst.size))
    day_objs = " ".join(_day_name(d) for d in range(1, inst.days + 1))

    lines.append("  (:objects")
    if room_objs:
        lines.append(f"    {room_objs} - habitacio")
    if res_objs:
        lines.append(f"    {res_objs} - reserva")
    lines.append(f"    {day_objs} - dia")
    lines.append("  )")
    lines.append("")

    # Init.
    lines.append("  (:init")
    if level in {"ext1", "ext3"}:
        lines.append("    (= (total-cost) 0)")
        lines.append("")

    for i, cap in enumerate(room_caps, start=1):
        lines.append(f"    (= (capacitat {_room_name(i)}) {cap})")
    lines.append("")

    for i, ppl in enumerate(res_people, start=1):
        lines.append(f"    (= (persones {_res_name(i)}) {ppl})")
    lines.append("")

    lines.append("    ;; Cada reserva ocupa els dies indicats.")
    lines.append("    ;; Convencio: [inici, fi) (el dia de fi NO s'ocupa).")

    for ri, d in dia_facts:
        lines.append(f"    (dia-reserva {_res_name(ri)} {_day_name(d)})")

    lines.append("  )")
    lines.append("")

    # Goal.
    lines.append("  (:goal")
    lines.append("    (and")
    if level == "basic":
        for i in range(1, inst.size + 1):
            lines.append(f"      (servida {_res_name(i)})")
    else:
        for i in range(1, inst.size + 1):
            lines.append(f"      (or (servida {_res_name(i)}) (rebutjada {_res_name(i)}))")
    lines.append("    )")
    lines.append("  )")

    if level in {"ext1", "ext3"}:
        lines.append("")
        lines.append("  (:metric minimize (total-cost))")

    lines.append(")")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Generate PDDL test problems for the hotel-reservations practice (basic/ext1/ext3)."
    )
    parser.add_argument(
        "n",
        nargs="?",
        type=int,
        help="Problem size: number of reservations to generate (preferred positional argument)",
    )
    parser.add_argument(
        "--size",
        dest="size",
        type=int,
        default=None,
        help="Number of reservations to generate (deprecated; prefer positional n)",
    )
    parser.add_argument("--level", choices=["basic", "ext1", "ext3"], default="basic")
    parser.add_argument("--seed", type=int, default=None)
    parser.add_argument("--days", type=int, default=30, help="Number of days (default: 30)")
    parser.add_argument(
        "--rooms",
        type=int,
        default=None,
        help="Number of rooms (default: ceil(size/2), min 2)",
    )
    parser.add_argument(
        "--out",
        type=str,
        default=None,
        help="Output filename (default: problem-<level>-auto-<size>.pddl)",
    )

    args = parser.parse_args()

    size = args.size if args.size is not None else args.n
    if size is None:
        raise SystemExit("Missing size. Usage: python generate_problems.py <n> [--level basic|ext1|ext3] ...")
    if args.size is not None and args.n is not None and args.size != args.n:
        raise SystemExit("Conflicting sizes: positional n differs from --size")

    # Warn early if ext3 is requested but its domain file isn't in this folder.
    if args.level == "ext3":
        domain_ext3 = Path(__file__).with_name("domain-ext3.pddl")
        if not domain_ext3.exists():
            print(
                "Warning: --level ext3 requested but domain-ext3.pddl was not found next to this script. ",
                "The generated problem will still reference (:domain reserves-hotel-ext3), ",
                "but planners will fail unless you provide the ext3 domain.",
                sep="",
            )

    if size <= 0:
        raise SystemExit("--size must be > 0")
    if args.days <= 0:
        raise SystemExit("--days must be > 0")

    rooms = args.rooms
    if rooms is None:
        rooms = max(2, math.ceil(size / 2))

    inst = Instance(
        level=args.level,
        size=size,
        days=args.days,
        rooms=rooms,
        seed=args.seed,
    )

    text = generate_problem_text(inst)

    out_name = args.out or f"problem-{args.level}-auto-{inst.size}.pddl"
    out_path = Path(__file__).with_name(out_name)
    out_path.write_text(text, encoding="utf-8")

    print(f"Wrote {out_path.name}")
    print(f"- level: {inst.level}")
    print(f"- reservations: {inst.size}")
    print(f"- rooms: {inst.rooms}")
    print(f"- days: {inst.days}")
    if inst.seed is not None:
        print(f"- seed: {inst.seed}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
