package model;

public class ParentStudent {
    private final int parentId;
    private final String parentName;
    private final int studentId;
    private final String studentName;

    public ParentStudent(int parentId, String parentName, int studentId, String studentName) {
        this.parentId    = parentId;
        this.parentName  = parentName;
        this.studentId   = studentId;
        this.studentName = studentName;
    }

    public int getParentId()    { return parentId; }
    public String getParentName()  { return parentName; }
    public int getStudentId()   { return studentId; }
    public String getStudentName() { return studentName; }
}
