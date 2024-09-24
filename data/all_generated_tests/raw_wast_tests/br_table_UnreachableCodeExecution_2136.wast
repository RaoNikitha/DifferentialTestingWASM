;; 6. **Test with Mismatched Operand Types:**    - Description: Create a `br_table` where the operand types do not match those expected by the target block’s configuration.    - Constraint Checked: Operand type matching between `br_table` and target block.    - Relates to Unreachable Code Execution: Mismatched operand types can cause unexpected behavior, resulting in an `unreachable` instruction being hit.

(assert_invalid
 (module
   (func $mismatched-operand-types
     (block (result i32) (i64.const 0) (br_table 0 (i32.const 0)))
   )
 )
 "type mismatch"
)