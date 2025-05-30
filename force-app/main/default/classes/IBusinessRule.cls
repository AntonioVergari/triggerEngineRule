public interface IBusinessRule {
    Boolean shouldExecute();
    void execute();
}