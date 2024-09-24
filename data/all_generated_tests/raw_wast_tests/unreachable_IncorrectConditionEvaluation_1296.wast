;; 7. Test a conditional branch with a global variable check followed by `unreachable`. Check for condition correctness in global context. Constraint: Validates global variables' use in condition evaluation. Example: `(global.get $g0) (br_if 0 (unreachable))`

(assert_invalid
  (module
    (global $g0 (mut i32) (i32.const 0))
    (func (global.get $g0) (br_if 0 (unreachable)))
  )
  "type mismatch"
)