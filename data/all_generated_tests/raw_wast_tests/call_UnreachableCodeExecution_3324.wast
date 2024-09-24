;; 3. **Test Description**:     - **Setup**: Define a function `X` that, based on a condition, calls another function `Y` that solely contains an `unreachable` instruction.    - **Constraint**: Evaluate the correctness of condition-based call behavior.    - **Reasoning**: Verifies conditional control flow leading to unintentional unreachable code execution.

(assert_invalid
 (module
  (type (func (param i32)))
  (func $y
   (unreachable)
  )
  (func $x 
   (param i32) 
   (if (i32.eqz (local.get 0)) 
    (call $y)
   )
  )
 )
 "unreachable"
)