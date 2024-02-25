from robot.api import logger

class Num():
    def add_two_numbers(self, number1, number2):
        """Adds two numbers and logs the result."""
        # Convert the string arguments to integers
        num1 = int(number1)
        num2 = int(number2)
        result = num1 + num2
        logger.info(f"The result is: {result}")
        return result