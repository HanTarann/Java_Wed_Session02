package ra.edu.session02.service;

import org.springframework.stereotype.Service;
import ra.edu.session02.model.Employee;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeService {

    public List<Employee> getAll() {

        List<Employee> list = new ArrayList<>();

        try {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            list.add(new Employee("NV001","Nguyễn Thị Lan","Kế toán",15000000,sdf.parse("2020-03-01"),"Đang làm"));
            list.add(new Employee("NV002","Trần Văn Hùng","Kỹ thuật",25000000,sdf.parse("2019-07-15"),"Đang làm"));
            list.add(new Employee("NV003","Lê Minh Đức","Kinh doanh",18500000,sdf.parse("2021-11-20"),"Nghỉ phép"));
            list.add(new Employee("NV004","Phạm Thu Hương","Kỹ thuật",22000000,sdf.parse("2022-01-05"),"Đang làm"));
            list.add(new Employee("NV005","Hoàng Văn Nam","Kế toán",12000000,sdf.parse("2023-06-10"),"Thử việc"));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Employee findByCode(String code){

        for(Employee e : getAll()){
            if(e.getCode().equals(code)){
                return e;
            }
        }

        return null;
    }

    public double totalTechSalary(){

        double total = 0;

        for(Employee e : getAll()){
            if(e.getDepartment().equals("Kỹ thuật")){
                total += e.getSalary();
            }
        }

        return total;
    }

}