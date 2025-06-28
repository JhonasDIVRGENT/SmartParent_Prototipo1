
package model;

import java.math.BigDecimal;

public class CourseGrade {
    private final String course;
    private final BigDecimal grade;
    public CourseGrade(String course, BigDecimal grade) {
        this.course = course;
        this.grade  = grade;
    }
    public String getCourse() { return course; }
    public BigDecimal getGrade() { return grade; }
}
