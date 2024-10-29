CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор сотрудника
    name VARCHAR(255) NOT NULL,           -- Имя сотрудника
    department VARCHAR(255) NOT NULL,     -- Отдел сотрудника
    manager_id INT,                       -- ID начальника (ссылка на другого сотрудника)
    FOREIGN KEY (manager_id) REFERENCES Employee(id) ON DELETE SET NULL  -- Внешний ключ на таблицу Employee
);