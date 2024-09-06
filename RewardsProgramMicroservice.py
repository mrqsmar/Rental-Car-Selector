# Some of the code is derived from Marques' main program. Specifically, the car codes file, printing the codes from
# the car codes file, and printing the description of the car class from the car codes file.

import sys
import time

time.sleep(5)

while True:
    rewards_file = open('rewards.txt', 'r+')
    rewards_file_read = rewards_file.read()
    if rewards_file_read == "run":
        print("Since you are a rewards member, you can pick any car class to rent from. \n")
        print("Please input 'codes' to see the codes you will need to input")
        user_input = input()

        if user_input == "codes":
            # Car classes file obtained from Marques
            with open('car_classes/codes.txt', 'r') as file:
                codes_content = file.read()
                print(codes_content)

        car_choice = input()

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

        if car_choice in car_classes:
            file_name = car_classes[car_choice]
            try:
                with open(f'car_classes/{file_name}', 'r') as rental_car:
                    for line in rental_car:
                        print(line.strip())
                    print("\nAre you content with this car class? Please enter 'yes' or 'no'.")
                    conformation = input()
                    if conformation == "yes":
                        rewards_file.seek(0)
                        rewards_file.truncate(0)
                        rewards_file.write(car_choice)
                        sys.exit()
                    else:
                        # Gives the user one more chance to choose a different class
                        print("\n Please enter another code to choose a different car class: ")
                        car_choice = input()
                        if car_choice in car_classes:
                            file_name = car_classes[car_choice]
                            try:
                                with open(f'car_classes/{file_name}', 'r') as rental_car:
                                    for line in rental_car:
                                        print(line.strip())
                                    print("\nAre you content with this car class? Please enter 'yes' or 'no'.")
                                    conformation = input()
                                    if conformation == "yes":
                                        rewards_file.seek(0)
                                        rewards_file.truncate(0)
                                        rewards_file.write(car_choice)
                                        sys.exit()
                            except FileNotFoundError:
                                print("File not found. Please try again.")
            except FileNotFoundError:
                print("File not found. Please try again.")

    else:
        "You are not a rewards member."