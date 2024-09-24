;; 4. Implement a `block` where `br_if` depends on the evaluated result of a function returning a constant value presumed always `false`. Verify if branching still occurs, indicating a malfunction in condition evaluation from functions.

(assert_invalid
  (module (func $cond-func (result i32)
    i32.const 0)
    (func $type-br_if-func-constant
      (block (result i32)
        (br_if 0 (call $cond-func))
        (i32.const 1))
      (i32.const 2))
  )
  "type mismatch"
)