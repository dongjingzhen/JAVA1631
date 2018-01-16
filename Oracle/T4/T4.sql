select * from emp;
select * from dept;
--��1���г�������һ��Ա�������в��š�
select d.dname from emp e,dept d where e.deptno = d.deptno group by d.dname;
--����2���г�н��ȡ�SMITH���������Ա����
select ename from emp where sal >(select sal from emp where ename = 'SMITH');
--3���г�����Ա������������ֱ���ϼ���������
select e.ename �¼�, m.ename �ϼ� from emp e left join emp m on e.mgr = m.empno;
--����4���г��ܹ�����������ֱ���ϼ�������Ա����
select e.ename from emp e inner join emp m on e.mgr = m.empno and e.hiredate<m.hiredate; 
select empno,ename,to_char(hiredate,'yyyy-mm-dd'),mgr from emp;
--����6���г�����jobΪ��CLERK��������Ա�����������䲿�����ơ�
select e.ename,d.dname from emp e,dept d where e.deptno = d.deptno and e.job = 'CLERK';
--����7���г����н�����1500�ĸ��ֹ�����
select job from emp where sal <1500 group by job; 
--����8���г��ڲ��š�SALES�������۲���������Ա�����������ٶ���֪�����۲��Ĳ��ű�š�
select ename from emp  where job = 'SALESMAN';
--����9���г�н����ڹ�˾ƽ��н�������Ա����
select ename from emp where sal>(select avg(sal)from emp) ;
--����10���г��롰SCOTT��������ͬ����������Ա����
select ename from emp where job =(select job from emp where ename = 'SCOTT');
--����11���г�н����ڲ���30��Ա����н�������Ա����������н��
select ename,sal from emp where sal in(select sal from emp where deptno = 30);
--��12���г�н������ڲ���30����������Ա����н���Ա��������н��
select ename,sal from emp where sal >(select max(sal) from emp where deptno = 30);
--����13���г���ÿ�����Ź�����Ա��������ƽ�����ʺ�ƽ���������ޡ�
select d.dname,count(e.ename),avg(e.sal),avg(hiredate) from emp e,dept d where e.deptno = d.deptno;
--����14���г�����Ա�����������������ƺ͹��ʡ�
select e.ename,d.dname,e.sal from emp e,dept d where e.deptno = d.deptno;
--����15���г�����ͬһ�ֹ��������ڲ�ͬ���ŵ�Ա����һ����ϡ�

--����16���г����в��ŵ���ϸ��Ϣ�Ͳ���������
select d.dname,d.loc,count(e.ename) from dept d,emp e where d.deptno=e.deptno group by  d.dname,d.loc; 
--����17���г����ֹ�������͹��ʡ�
select min(sal),job from emp where job in(select job from emp) group by job;
--����18���г��������ŵ�MANAGER�����������н��jobΪMANAGER����
select min(sal),deptno from emp where job = 'MANAGER'  group by deptno;
����--19���г�����Ա�����깤�ʣ�����н�ӵ͵�������
select ename,sal*12 from emp order by sal*12 desc;
