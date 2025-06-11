public abstract class AbstractBusinessRule implements IBusinessRule {
    protected IBusinessRule nextRule;

    public void nextAction() {
        nextRule.process();
    }

    public virtual Boolean shouldExecute() {
        return true;
    }

    public abstract void execute();

    

    public void process() {
        if(shouldExecute()) {
            execute();
        } else {
            nextAction();
        }
    }
}