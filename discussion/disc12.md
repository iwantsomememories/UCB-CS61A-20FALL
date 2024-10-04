## Question 2.1
```sql
select name from records where supervisor='Oliver Warbucks';
```

## Question 2.2
```sql
select * from records where supervisor = name;
```

## Question 2.3
```sql
select name from records where salary > 50000 order by name;
```

## Question 3.1
```sql
select b.day, b.time from records as a, meetings as b where a.supervisor = 'Oliver Warbucks' and a.division = b.division;
```

## Question 3.2
```sql
select a.name, b.name from records as a, records as b where a.division = b.division and a.name < b.name;
```

## Question 3.3
**可以过滤冗余输出，因为通过比较运算符确定了固定顺序。**

## Question 3.4
```sql
select a.name from records as a, records as b where a.supervisor = b.name and a.division <> b.division;
```

## Question 4.1
```sql
select supervisor, sum(salary) from records group by supervisor;
```

## Question 4.2
```sql
select b.day from records as a, meetings as b where a.division = b.division group by b.day having count(*) < 5;
```

## Question 4.3
```sql
select a.division, a.name, b.name from records as a, records as b  where a.division = b.division and a.salary + b.salary < 100000 and a.name < b.name;
```

## Question 5.1
```sql
create table num_taught as
    select professor, course, count(*) as times from courses group by professor, course;
```

## Question 5.2
```sql
select a.professor, b.professor, a.course from num_taught as a, num_taught as b where a.course = b.course and a.times = b.times and a.professor < b.professor;
```

## Question 5.3
```sql
select a.professor, b.professor from courses as a, courses as b where a.course = b.course and a.semester = b.semester and a.professor < b.professor group by a.course, a.semester having count(*) > 1;
```
