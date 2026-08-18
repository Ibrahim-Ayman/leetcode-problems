class StockSpanner(object):

    def __init__(self):
        self.prices = []
        self.output = []

    def next(self, price):
        result= 0 
        while self.prices and price >= self.prices[-1] : 
            result += self.output[-1]
            self.output.pop()
            self.prices.pop()
            
        self.prices.append(price)
        self.output.append(result+1)
        return result+1


# Your StockSpanner object will be instantiated and called as such:
# obj = StockSpanner()
# param_1 = obj.next(price)