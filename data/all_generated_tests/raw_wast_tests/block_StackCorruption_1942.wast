;; 3. Generate a test where a `block` with a single `typeidx` references a function type that expects a specific input stack depth and returns a result. Inside the block, manipulate the stack depth and use a `br_if` condition to check if the stack underflows or overflows upon branching, revealing mismanaged stack labels in `wizard_engine`.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func (result i32)
      (block (type $sig)
        (i32.const 0) (i32.const 1) (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)