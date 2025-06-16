phases = {
    "work": "@text",
    "break": "@green",
    "paused": "@peach"
}

for i in range(101):
    stop1 = i
    stop2 = min(i + 0.1, 100.0)
    for phase, color in phases.items():
        print(f"""#custom-pomodoro.{phase}.perc{i} {{
    background-image: linear-gradient(
        to right,
        {color} {stop1:.1f}%,
        transparent {stop2:.1f}%
    );
}}""")
