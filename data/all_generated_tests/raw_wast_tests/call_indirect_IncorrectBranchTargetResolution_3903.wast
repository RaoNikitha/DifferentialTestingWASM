;; 2. **Test Case 2**:    - **Description**: Generate a module using multiple nested loops where `call_indirect` is used in the inner loop. Insert a `br` instruction targeting the inner loop. The table index should be valid within the inner loop, ensuring that loop nesting levels are handled correctly.    - **Constraint Checked**: Precise label resolution within multiple nested loops.    - **Incorrect Branch Target Resolution**: Ensures that the `br` instruction does not misinterpret the loop levels causing unintended behavior.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (func $nested-loops 
      (result i32)
      (local i32)
      loop $outer_loop
        (local.set 0 (i32.const 10))
        loop $inner_loop
          (call_indirect (type 0) (local.get 0) (i32.const 0))
          br $inner_loop
          br $outer_loop
        end
      end
      (i32.const 0)
    )
    (table 1 funcref)
  )
  "unknown table"
)