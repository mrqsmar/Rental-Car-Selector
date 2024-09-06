import sys
import time
import os

def title(spacing=0, indent=0):
    """Returns the title of the app with spacing and indentation."""
    title_text = """                                                                                                                                                                                                                                                                                                                                
______              _          _   _____                _____        _              _               
| ___ \            | |        | | /  __ \              /  ___|      | |            | |              
| |_/ / ___  _ __  | |_  __ _ | | | /  \/  __ _  _ __  \ `--.   ___ | |  ___   ___ | |_  ___   _ __ 
|    / / _ \| '_ \ | __|/ _` || | | |     / _` || '__|  `--. \ / _ \| | / _ \ / __|| __|/ _ \ | '__|
| |\ \|  __/| | | || |_| (_| || | | \__/\| (_| || |    /\__/ /|  __/| ||  __/| (__ | |_| (_) || |   
\_| \_|\___||_| |_| \__|\__,_||_|  \____/ \__,_||_|    \____/  \___||_| \___| \___| \__|\___/ |_|  
    """
    return "\n" * spacing + " " * indent + title_text

def tiny_description(spacing=0, indent=0):
    """Shares the purpose of the app"""
    description_text = "Here to get you the best rental car!"
    return "\n" * spacing + " " * indent + description_text

def collect_user_input():
    """Prompt user for what they first want"""
    user_input = input("Enter the Class of car you are looking for from this list. \n")
    return user_input

def commands():
    """Prompt the user for instructions"""
    user_input = "If you want to know more about my app, input 'I' if you want additional info, and 'Q' to leave, or type 'rewards', 'random', 'luxury', 'passenger' to run microservice"
    return user_input

def run_user_input(user_input):
    """Runs the user input and gives them the appropriate file"""
    file_mapping = {
        "A": "generate_a_class.txt",
        "B": "generate_b_class.txt",
        "C": "generate_c_class.txt",
        "D": "generate_d_class.txt",
        "E": "generate_e_class.txt",
        "E6": "generate_e6_class.txt",
        "F": "generate_f_class.txt",
        "G": "generate_g_class.txt",
        "P4": "generate_p4_class.txt",
        "G4": "generate_g4_class.txt",
        "O4": "generate_o4_class.txt",
        "V4": "generate_v4_class.txt",
        "V": "generate_v_class.txt",
        "Q4": "generate_q4_class.txt",
        "L": "generate_l_class.txt",
        "L4": "generate_l4_class.txt",
        "T": "generate_t_class.txt",
        "T6": "generate_t6_class.txt",
        "H4": "generate_h4_class.txt",
        "K4": "generate_k4_class.txt",
        "P6": "generate_p6_class.txt",
        "R": "generate_r_class.txt",
        "M": "generate_m_class.txt",
        "O6": "generate_o6_class.txt",
        "S": "generate_s6_class.txt",
        "U": "generate_u_class.txt",
        "I": "about_page.txt"
    }

    if user_input in file_mapping:
        file_name = file_mapping[user_input]
        try:
            with open(f'car_classes/{file_name}', 'r') as rental_car:
                for line in rental_car:
                    print(line.strip())
        except FileNotFoundError:
            print("File not found. Please try again.")
    elif user_input.lower() in ["q", "quit"]:
        confirmation = input("Are you really sure you wanna quit... respond (yes/no): ").strip().lower()
        if confirmation == "yes":
            goodbye()
        else:
            print("Continuing...")
    else:
        print("Invalid input. Please try again.")

def print_tiny_description():
    """Prints a tagline"""
    print(tiny_description())

def codes():
    """asks the user to print out the codes needed for use."""
    while True:
        user_input = input("Please input 'codes' to see the codes you will need to input!\n")
        if user_input.lower() == 'codes':
            try:
                with open('car_classes/codes.txt', 'r') as file:
                    codes_content = file.read()
                    print(codes_content)
            except FileNotFoundError:
                print("The codes file is not found.")
            break  # Exit the loop if the input is valid and codes are displayed
        else:
            print("Invalid input. Please input 'codes' to see the codes.")

def indent_text(text, indent_level=0):
    """Indent text by a specified level."""
    indent = " " * indent_level
    indented_text = "\n".join(indent + line for line in text.splitlines())
    return indented_text

def check_rewards_member():
    """Check if the user is a rewards member and process their choice."""
    print("Are you a rewards member? Please enter yes or no")
    user_input = input().strip().lower()

    if user_input == "yes":
        with open('rewards.txt', 'a+') as rewards_program:
            rewards_program.write('run')

        time.sleep(10)

        with open('rewards.txt', 'r+') as rewards_program:
            car_choice = rewards_program.read().strip()
            rewards_program.seek(0)
            rewards_program.truncate(0)
        
        print("\nThe car class you chose is:", car_choice)
    else:
        print("\nYou are not a rewards member.")

def checking_luxury_vehicle():
    """Check if the user wants a luxury car."""
    print("Would you like a luxury car? Please enter yes or no")
    user_input = input().strip().lower()

    if user_input == "yes":
        with open('luxury.txt', 'a+') as luxury_program:
            luxury_program.write('run')

        time.sleep(10)

        with open('luxury.txt', 'r+') as luxury_program:
            car_choice = luxury_program.read().strip()
            luxury_program.seek(0)
            luxury_program.truncate(0)
        
        print("\nThe luxury car you got was:", car_choice)
    else:
        print("\nYou didn't want a luxury car.")

def checking_managers_special():
    """Checks if the user wants a random car"""
    print("Would you want the managers special? Say yes or no")
    user_input = input().strip().lower()

    if user_input == "yes":
        with open('random.txt', 'a+') as random_program:
            random_program.write('run')

        time.sleep(10)

        with open('random.txt', 'r+') as random_program:
            car_choice = random_program.read().strip()
            random_program.seek(0)
            random_program.truncate(0)
        
        print("\nThe managers special is:", car_choice)
    else:
        print("\nEnter a specific car.")

def checking_passenger_count():
    """Checks if the user how many passengers are in"""
    print("Are there more than 1 passenger? Say yes or no")
    user_input = input().strip().lower()

    if user_input == "yes":
        with open('passenger.txt', 'a+') as passenger_program:
            passenger_program.write('run')

        time.sleep(10)

        with open('passenger.txt', 'r+') as passenger_program:
            car_choice = passenger_program.read().strip()
            passenger_program.seek(0)
            passenger_program.truncate(0)
        
        print("\nThe car with the right passenger count is:", car_choice)
    else:
        print("\nYou need to figure out your plans more.")


def print_goodbye_message():
    """Thanks the user for using this meesage"""
    print("Thank you for using this app, safe travels!")

def goodbye():
    print_goodbye_message()
    sys.exit()

def interact_with_microservice(request_file, response_file):
    """Interact with a microservice by writing to request file and reading from response file."""
    with open(request_file, 'w') as req_file:
        req_file.write('run')

    # Wait for the microservice to process the request
    time.sleep(5)

    # Check the response file for the result
    if os.path.exists(response_file):
        with open(response_file, 'r') as res_file:
            response = res_file.read().strip()
            return response
    else:
        print(f"Response file {response_file} not found. Please ensure the microservice is running.")
        return None

if __name__ == "__main__":
    print(indent_text(title()))
    print(indent_text(tiny_description(), indent_level=30))
    print()
    codes()
    print()
    while True:
        print(commands())
        user_input = collect_user_input()
        print()
        if user_input.lower() == "rewards":
            check_rewards_member()
        elif user_input == 'random':
            checking_managers_special()
        elif user_input.lower() == "luxury":
            checking_luxury_vehicle()
        elif user_input.lower() == "passenger":
            checking_passenger_count()
        else:
            run_user_input(user_input)
        print()