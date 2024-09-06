import time
import random
import os

# Delay to simulate some processing time before starting the main loop
time.sleep(5)

# Dictionary mapping car codes to their respective file names
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

while True:
    # Reading the 'random.txt' file to check for the "run" command
    with open('random.txt', 'r+') as special_file:
        special_file_read = special_file.read().strip()

    if special_file_read.lower() == "run":
        response = "Since you have picked the manager special, you will get a random class of car.\n"
        response += "Please input 'codes' to see the codes you will end up seeing\n"

        user_input = input().strip().lower()

        if user_input == "codes":
            # Reading the car classes codes from the specified file
            try:
                with open('car_classes/codes.txt', 'r') as file:
                    codes_content = file.read()
                    response += codes_content
            except FileNotFoundError:
                response += "Error: codes.txt file not found in car_classes directory.\n"

        # Randomly selecting a car class
        random_car_code = random.choice(list(car_classes.keys()))
        response += f"You have been assigned a random car class: {random_car_code}\n"

        # Display the corresponding file content based on the random car choice
        file_name = car_classes[random_car_code]
        try:
            with open(f'car_classes/{file_name}', 'r') as car_file:
                response += car_file.read()
        except FileNotFoundError:
            response += f"Error: {file_name} file not found in car_classes directory.\n"

        # Write the response to 'random_response.txt'
        with open('random_response.txt', 'w') as res_file:
            res_file.write(response)

        # Clear the request file for the next run
        with open('random.txt', 'w') as special_file:
            special_file.write('')
    else:
        print("Waiting for 'run' command in random.txt...")
    time.sleep(1)
