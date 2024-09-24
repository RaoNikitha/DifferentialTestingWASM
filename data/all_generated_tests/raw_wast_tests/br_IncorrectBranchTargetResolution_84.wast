;; 5. **Operand Stack Consistency Test**:    - Define several blocks with specific input/output operand configurations and insert `br` instructions targeting these blocks. Track operand stacks before and after `br` execution to verify the operand stack is correctly managed and restored upon branching, specifically checking correct label resolution.

(assert_invalid
  (module
    (func $operand-stack-consistency
      (block $outer (result i32 i32)
        (i32.const 1)
        (block $inner (result i32)
          (i32.const 2)
          (br 0)  ;; Targeting $inner block
          (i32.const 3)
        )
        (i32.const 4)
      )
      (drop) (drop)
    )
  )
  "type mismatch"
)