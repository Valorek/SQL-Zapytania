-- PIERWSZA BAZA DANYCH

-- 1. Minimalne, maksymalne, średnie, suma zarobków oraz liczba pracowników
SELECT 
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary,
    AVG(Salary) AS AvgSalary,
    SUM(Salary) AS TotalSalary,
    COUNT(*) AS EmployeeCount
FROM Employee;

-- 2. Grupowanie po roku i miesiącu zatrudnienia
SELECT 
    DATE_FORMAT(StartDate, '%Y-%m') AS YearMonth,
    COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY YearMonth;

-- 3. Sumy zamówień klientów (bez kart)
SELECT 
    c.CustomerName,
    SUM(o.Total) AS TotalOrders
FROM Orders o
JOIN Customer c ON o.CustomerId = c.CustomerId
WHERE o.PaymentType != 'Card'
GROUP BY c.CustomerName
ORDER BY TotalOrders ASC;

-- 4. Średnie zarobki w departamentach z wynagrodzeniem powyżej 1400
SELECT 
    d.DepartmentName,
    r.RegionName,
    AVG(e.Salary) AS AvgSalary
FROM Employee e
JOIN Department d ON e.DepartmentId = d.DepartmentId
JOIN Region r ON d.RegionId = r.RegionId
GROUP BY d.DepartmentName, r.RegionName
HAVING AvgSalary > 1400;

-- 5. Sumy iloczynów liczby produktów i ceny netto (czerwiec i lipiec 2020, płatność kartą)
SELECT 
    o.OrderId,
    o.DateOrdered,
    o.DateShipped,
    c.CustomerName,
    p.ProductName,
    SUM(op.Quantity * op.PriceNet) AS TotalNetValue
FROM Orders o
JOIN OrderPosition op ON o.OrderId = op.OrderId
JOIN Product p ON op.ProductId = p.ProductId
JOIN Customer c ON o.CustomerId = c.CustomerId
WHERE o.PaymentType = 'Card' 
  AND DATE_FORMAT(o.DateOrdered, '%Y-%m') IN ('2020-06', '2020-07')
GROUP BY o.OrderId, p.ProductName
ORDER BY o.OrderId, o.DateOrdered;

-- 6. Klienci z zamówieniami i regionem
SELECT DISTINCT 
    c.CustomerId,
    c.CustomerName,
    r.RegionName
FROM Customer c
JOIN Region r ON c.RegionId = r.RegionId
JOIN Orders o ON c.CustomerId = o.CustomerId;

-- 7. Pracownicy z zarobkami poniżej średniej działu sprzedaży
SELECT 
    e.EmployeeFirstName,
    e.EmployeeLastName,
    e.Salary
FROM Employee e
WHERE e.Salary < (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DepartmentId = (SELECT DepartmentId FROM Department WHERE DepartmentName = 'Sales')
)
ORDER BY e.Salary DESC;

-- 8. Klienci z wielokrotnymi wystąpieniami nazw
SELECT 
    c.CustomerName,
    c.Address,
    c.City,
    r.RegionName
FROM Customer c
JOIN Region r ON c.RegionId = r.RegionId
GROUP BY c.CustomerName, c.Address, c.City, r.RegionName
HAVING COUNT(*) > 1;

-- 9. Zbiór nazw departamentów i regionów
SELECT DepartmentName AS Name FROM Department
UNION
SELECT RegionName AS Name FROM Region;

-- 10. Klienci, regiony i daty zamówień (Europa lub określone daty)
SELECT 
    c.CustomerName,
    r.RegionName,
    o.DateOrdered
FROM Orders o
JOIN Customer c ON o.CustomerId = c.CustomerId
JOIN Region r ON c.RegionId = r.RegionId
WHERE r.RegionName = 'Europe' OR (o.DateOrdered BETWEEN '2020-03-01' AND '2020-04-25')
ORDER BY c.CustomerId;

-- DRUGA BAZA DANYCH

-- 1. Minimalne, maksymalne, średnie zarobki profesorów
SELECT 
    MIN(Payment) AS MinSalary,
    MAX(Payment) AS MaxSalary,
    ROUND(AVG(Payment), 0) AS AvgSalary,
    SUM(Payment) AS TotalSalary,
    COUNT(*) AS ProfessorCount
FROM Professors;

-- 2. Grupowanie studentów po roku urodzenia
SELECT 
    YEAR(DateOfBirth) AS BirthYear,
    COUNT(*) AS StudentCount
FROM Students
GROUP BY BirthYear;

-- 3. Suma czesnego studentów na 3 lata
SELECT 
    StudentID,
    FirstName,
    LastName,
    Tuition * 6 AS TotalTuition
FROM Students
WHERE Tuition * 6 >= 2700
ORDER BY TotalTuition DESC;

-- 4. Średnie pensje profesorów na wydziałach (powyżej 3000)
SELECT 
    d.DepartmentName,
    AVG(p.Payment) AS AvgSalary
FROM Professors p
JOIN Departments d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING AvgSalary > 3000;

-- 5. Studenci z wydziału matematyki
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
JOIN Programs p ON s.ProgramID = p.ProgramID
JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics';

-- 6. Semestralne dochody wydziałów
SELECT 
    d.DepartmentName,
    SUM(s.Tuition) AS SemesterIncome
FROM Students s
JOIN Programs p ON s.ProgramID = p.ProgramID
JOIN Departments d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 7. Studenci zapisani na Algorithms i Data Structures
SELECT DISTINCT 
    s.FirstName,
    s.LastName,
    e.EnrollmentDate
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Algorithms', 'Data Structures');

-- 8. Profesorowie z zarobkami poniżej średniej wydziału
SELECT 
    p.FirstName,
    p.LastName,
    p.Payment,
    d.DepartmentName
FROM Professors p
JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE p.Payment < (
    SELECT AVG(Payment)
    FROM Professors
    WHERE DepartmentID = p.DepartmentID
)
ORDER BY p.LastName, p.FirstName;

-- 9. Zbiór nazw wydziałów i kierunków
SELECT DepartmentName AS Name FROM Departments
UNION
SELECT ProgramName AS Name FROM Programs;
