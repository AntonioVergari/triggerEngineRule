public interface IBusinessRule {
    Boolean shouldExecute();
    void execute();
    void process();
    void nextAction();
}