-- Create tables
CREATE TABLE markets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    description TEXT
);

CREATE TABLE positions (
    id SERIAL PRIMARY KEY,
    market_id INT REFERENCES markets(id),
    entry_date DATE NOT NULL,
    entry_price DECIMAL(10, 2) NOT NULL,
    exit_date DATE,
    exit_price DECIMAL(10, 2),
    position_size INT NOT NULL,
    status VARCHAR(20) NOT NULL,  -- 'open', 'closed'
    profit_loss DECIMAL(10, 2)
);

CREATE TABLE trades (
    id SERIAL PRIMARY KEY,
    position_id INT REFERENCES positions(id),
    trade_date DATE NOT NULL,
    trade_price DECIMAL(10, 2) NOT NULL,
    trade_type VARCHAR(10) NOT NULL,  -- 'buy' or 'sell'
    units INT NOT NULL
);

CREATE TABLE signals (
    id SERIAL PRIMARY KEY,
    market_id INT REFERENCES markets(id),
    signal_date DATE NOT NULL,
    signal_type VARCHAR(10) NOT NULL,  -- 'entry' or 'exit'
    breakout_period INT NOT NULL,  -- Period for breakout signal (e.g., 20 days, 55 days)
    signal_price DECIMAL(10, 2) NOT NULL
);

-- Insert initial data into markets table
INSERT INTO markets (name, symbol, description) VALUES
('30 Year U.S. Treasury Bond', 'ZB', 'Chicago Board of Trade'),
('10 Year U.S. Treasury Note', 'ZN', 'Chicago Board of Trade'),
('Coffee', 'KC', 'New York Coffee Cocoa and Sugar Exchange'),
('Cocoa', 'CC', 'New York Coffee Cocoa and Sugar Exchange'),
('Sugar', 'SB', 'New York Coffee Cocoa and Sugar Exchange'),
('Cotton', 'CT', 'New York Coffee Cocoa and Sugar Exchange'),
('Swiss Franc', '6S', 'Chicago Mercantile Exchange'),
('British Pound', '6B', 'Chicago Mercantile Exchange'),
('Japanese Yen', '6J', 'Chicago Mercantile Exchange'),
('Canadian Dollar', '6C', 'Chicago Mercantile Exchange'),
('S&P 500 Stock Index', 'ES', 'Chicago Mercantile Exchange'),
('Eurodollar', 'GE', 'Chicago Mercantile Exchange'),
('90 Day U.S. Treasury Bill', 'IR', 'Chicago Mercantile Exchange'),
('Gold', 'GC', 'Comex'),
('Silver', 'SI', 'Comex'),
('Copper', 'HG', 'Comex'),
('Crude Oil', 'CL', 'New York Mercantile Exchange'),
('Heating Oil', 'HO', 'New York Mercantile Exchange'),
('Unleaded Gas', 'RB', 'New York Mercantile Exchange');
