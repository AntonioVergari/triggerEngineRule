/*
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

	https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 */

public abstract class AbstractBusinessRule implements IBusinessRule {
    protected IBusinessRule nextRule;

    public void nextAction() {
        if(nextRule != null) {
            nextRule.process();
        }
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
