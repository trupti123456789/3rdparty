from robot.api import logger

class AdditionLibrary:
    def add_two_numbers(self, number1, number2):
        """Adds two numbers and logs the result."""
        result = number1 + number2
        logger.info(f"The result is: {result}")
        return result