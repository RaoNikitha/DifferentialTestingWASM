;; 5. **Forward Branch with Premature Operand Consumption**:    - Utilize a forward branch (`br`) inside a block that consumes operands prematurely, potentially corrupting the stack.    - Assess whether both implementations handle the forward branch correctly without losing or misinterpreting stack values.

(assert_invalid
  (module (func $forward-branch-premature-consumption
    (i32.const 5) (i32.const 10)
    (block (result i32) 
      (block (result i32)
        (br 1 (i32.const 3)) 
        (i32.add)) 
      (i32.add))
  ))
  "type mismatch"
)