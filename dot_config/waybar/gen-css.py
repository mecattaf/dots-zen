
import sys

def generate_pomodoro_progress_css(filepath):
    colors = {
        'work': '@text',
        'break': '@green',
        'paused': '@peach'
    }

    with open(filepath, 'a') as css_file:
        css_file.write("\n/* Pomodoro progress bar percentage classes generated */\n")
        for phase, color in colors.items():
            for perc in range(0, 101):
                css_line = (
                    f"#custom-pomodoro.{phase}.perc{perc} {{\n"
                    f"    background-image: linear-gradient(to right, {color} {perc}%, transparent {perc}%);\n"
                    f"}}\n"
                )
                css_file.write(css_line)
        css_file.write("/* End of generated pomodoro progress CSS */\n")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python gen-css.py <your-css-file>")
        sys.exit(1)
    
    css_path = sys.argv[1]
    generate_pomodoro_progress_css(css_path)
    print(f"Pomodoro progress CSS appended to {css_path}")
