;; 6. **Test for Block Consumption but No Production**:    - Construct a block that consumes operands but does not produce the declared result despite the `blocktype` declaring it should. This tests improper stack state restoration.    - Constraint: Operand stack must meet block type requirements.    - CFG Impact: CFG produces incorrect paths due to type mismatch.

(assert_invalid
  (module (func $block_consume_no_produce (result i32)
    (block (result i32) (i32.const 42))
  ))
  "type mismatch"
)