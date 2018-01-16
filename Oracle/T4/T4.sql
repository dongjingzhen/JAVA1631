select * from emp;
select * from dept;
--　1、列出至少有一个员工的所有部门。
select d.dname from emp e,dept d where e.deptno = d.deptno group by d.dname;
--　　2、列出薪金比“SMITH”多的所有员工。
select ename from emp where sal >(select sal from emp where ename = 'SMITH');
--3、列出所有员工的姓名及其直接上级的姓名。
select e.ename 下级, m.ename 上级 from emp e left join emp m on e.mgr = m.empno;
--　　4、列出受雇日期早于其直接上级的所有员工。
select e.ename from emp e inner join emp m on e.mgr = m.empno and e.hiredate<m.hiredate; 
select empno,ename,to_char(hiredate,'yyyy-mm-dd'),mgr from emp;
--　　6、列出所有job为“CLERK”（办事员）的姓名及其部门名称。
select e.ename,d.dname from emp e,dept d where e.deptno = d.deptno and e.job = 'CLERK';
--　　7、列出最低薪金大于1500的各种工作。
select job from emp where sal <1500 group by job; 
--　　8、列出在部门“SALES”（销售部）工作的员工的姓名，假定不知道销售部的部门编号。
select ename from emp  where job = 'SALESMAN';
--　　9、列出薪金高于公司平均薪金的所有员工。
select ename from emp where sal>(select avg(sal)from emp) ;
--　　10、列出与“SCOTT”从事相同工作的所有员工。
select ename from emp where job =(select job from emp where ename = 'SCOTT');
--　　11、列出薪金等于部门30中员工的薪金的所有员工的姓名和薪金。
select ename,sal from emp where sal in(select sal from emp where deptno = 30);
--　12、列出薪金高于在部门30工作的所有员工的薪金的员工姓名和薪金。
select ename,sal from emp where sal >(select max(sal) from emp where deptno = 30);
--　　13、列出在每个部门工作的员工数量、平均工资和平均服务期限。
select d.dname,count(e.ename),avg(e.sal),avg(hiredate) from emp e,dept d where e.deptno = d.deptno;
--　　14、列出所有员工的姓名、部门名称和工资。
select e.ename,d.dname,e.sal from emp e,dept d where e.deptno = d.deptno;
--　　15、列出从事同一种工作但属于不同部门的员工的一种组合。

--　　16、列出所有部门的详细信息和部门人数。
select d.dname,d.loc,count(e.ename) from dept d,emp e where d.deptno=e.deptno group by  d.dname,d.loc; 
--　　17、列出各种工作的最低工资。
select min(sal),job from emp where job in(select job from emp) group by job;
--　　18、列出各个部门的MANAGER（经理）的最低薪金（job为MANAGER）。
select min(sal),deptno from emp where job = 'MANAGER'  group by deptno;
　　--19、列出所有员工的年工资，按年薪从低到高排序。
select ename,sal*12 from emp order by sal*12 desc;
