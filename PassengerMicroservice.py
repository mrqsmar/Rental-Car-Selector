import sys
import time
import os

def collect_passenger_information():
    """Prompts user to get their information and returns car codes based on the number of passengers."""
    prompt = "How many people are coming with you on your trip including yourself? Note: Max 12\n"
    while True:
        passenger_count_input = input(prompt)
        try:
            passenger_count = int(passenger_count_input)
            if passenger_count <= 0 or passenger_count > 12:
                print("Please enter a number between 1 and 12.")
            else:
                if passenger_count < 5:
                    print("Great, you should consider all classes")
                    return ["A", "B", "C", "D", "E", "E6", "F", "G", "P4", "G4", "O4", "V4", "V", "Q4", "L", "L4", "T", "T6", "H4", "K4", "P6", "R", "M", "O6", "S", "U"]
                elif passenger_count < 8:
                    print("Great, you should consider classes L4, P6, and R")
                    return ["L4", "P6", "R"]
                else:
                    print("Unfortunately, your only choice is class M")
                    return ["M"]
        except ValueError:
            print("Please enter a valid number.\n")

def process_user_input(user_input):
    """Processes the user input and performs actions based on the input."""
    car_classes = {
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

    if user_input == "codes":
        try:
            with open('car_classes/codes.txt', 'r') as file:
                codes_content = file.read()
                print(codes_content)
        except FileNotFoundError:
            print("Error: codes.txt file not found in car_classes directory.")
    elif user_input == "info":
        recommended_codes = collect_passenger_information()
        print(f"Based on your passenger count, the recommended car classes are: {', '.join(recommended_codes)}")
    else:
        car_choice = user_input.upper()
        if car_choice in car_classes:
            file_name = car_classes[car_choice]
            try:
                with open(f'car_classes/{file_name}', 'r') as car_file:
                    print(car_file.read())
            except FileNotFoundError:
                print(f"Error: {file_name} file not found in car_classes directory.")
        else:
            print("Invalid car code. Please try again.")

def main_loop():
    # Delay to simulate some processing time before starting the main loop
    time.sleep(5)

    # Main loop
    while True:
        # Reading the 'passenger.txt' file to check for the "run" command
        with open('passenger.txt', 'r+') as passenger_file:
            passenger_file_read = passenger_file.read().strip()

        if passenger_file_read.lower() == "run":
            print("This microservice tells you what cars you can rent based off of the passengers you have in your car.\n")
            print("Please input 'codes' to see the codes you will need to input or 'info' to get passenger information")

            user_input = input().strip().lower()
            process_user_input(user_input)

            # Clear the request file for the next run
            with open('passenger.txt', 'w') as passenger_file:
                passenger_file.write('')
        else:
            time.sleep(1)  # Waiting before checking the file again

if __name__ == "__main__":
    main_loop()