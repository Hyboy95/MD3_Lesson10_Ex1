use QuanLySinhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from Subject
where credit = (select max(credit) from subject);
-- having credit >= all (
-- 	select credit
--     from subject
-- );

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select S.SubID, S.SubName, S.Credit, S.Status, M.Mark
from Subject as S
join Mark as M on S.SubID = M.SubID
having mark >= all (
	select mark
    from Mark
);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
-- xếp hạng theo thứ tự điểm giảm dần

select S.StudentName, S.Address, S.Phone,
	   S.Status,C.ClassName, avg(M.Mark) as 'Điểm TB'
from Student as S
join Class as C on S.ClassID = C.ClassID
join Mark as M on S.StudentID = M.StudentID
group by S.StudentID, C.ClassID
order by avg(M.Mark) desc;




