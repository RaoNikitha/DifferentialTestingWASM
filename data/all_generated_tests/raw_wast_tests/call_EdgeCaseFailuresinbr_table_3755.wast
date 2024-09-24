;; 4. **Test for Nested 'br_table' with Function Calls**:    - Test how 'br_table' performs within a nested control flow involving multiple 'call' instructions.    - Define a 'br_table' within a 'block' or 'loop' structure that could lead to indirect calls through nested branches.    - Relates to ensuring proper control flow management and stack correctness when dealing with nested structures in 'br_table'.

(assert_invalid
  (module
    (func $nested-br-table-call
      (block $outer
        (block $inner
          (br_table $inner $outer 0 (call 0))
        )
      )
    )
    (type (func (result i32)))
    (func $called-func (i32.const 42))
  )
  "unknown function"
)