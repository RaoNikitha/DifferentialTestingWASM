;; 3. **Test Description**:    - Create a function where `nop` instructions are placed immediately after `br` and `br_if` instructions. Verify the control target remains unaffected.    - **Constraint Checked**: `nop`'s lack of impact on branch targets and control flow.    - **Relation to CFG**: Ensures branches correctly skip `nop` instructions, maintaining a consistent flow.

 ;; (module (func $br-nop-targets (result i32) block br 0 nop nop i32.const 1 end))