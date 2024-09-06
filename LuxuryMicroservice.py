import sys
import time
import os

def read_car_class(file_name):
    try:
        with open(f'car_classes/{file_name}', 'r') as rental_car:
            for line in rental_car:
                print(line.strip())
            print("\nAre you content with this car class? Please enter 'yes' or 'no'.")
            confirmation = input()
            return confirmation
    except FileNotFoundError:
        print("File not found. Please try again.")
        return None

def main():
    time.sleep(5)

    car_classes = {
        "P4": "generate_p4_class.txt",
        "G4": "generate_g4_class.txt",
        "O4": "generate_o4_class.txt",
        "H4": "generate_h4_class.txt",
        "K4": "generate_k4_class.txt",
        "P6": "generate_p6_class.txt",
    }

    while True:
        with open('luxury.txt', 'r+') as luxury_file:
            luxury_file_read = luxury_file.read().strip()

            if luxury_file_read == "run":
                print("Since you want a luxury car, you must input P4, G4, O4, H4, K4 and P6 \n")
                print("Please input 'luxury codes' to see the code list you will need to input")
                user_input = input().strip()

                if user_input == "luxury codes":
                    try:
                        with open('car_classes/luxury_codes.txt', 'r') as file:
                            codes_content = file.read()
                            print(codes_content)
                    except FileNotFoundError:
                        print("The codes file is not found.")

                car_choice = input().strip()

                if car_choice in car_classes:
                    file_name = car_classes[car_choice]
                    confirmation = read_car_class(file_name)

                    if confirmation == "yes":
                        luxury_file.seek(0)
                        luxury_file.truncate(0)
                        luxury_file.write(car_choice)
                        sys.exit()
                    else:
                        print("\nPlease enter another code to choose a different car class: ")
                        car_choice = input().strip()

                        if car_choice in car_classes:
                            file_name = car_classes[car_choice]
                            confirmation = read_car_class(file_name)

                            if confirmation == "yes":
                                luxury_file.seek(0)
                                luxury_file.truncate(0)
                                luxury_file.write(car_choice)
                                sys.exit()
                        else:
                            print("Invalid car code.")
                else:
                    print("Invalid car code.")
            else:
                print("You can't get a luxury car.")
                time.sleep(5)  # Add a delay to avoid tight loop

if __name__ == "__main__":
    main()

