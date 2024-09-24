;; Test a nested conditional with multiple `br_if` conditions and `call_indirect` to ensure that incorrect evaluations do not cause multiple unintended function calls.

(assert_invalid
  (module
    (type (func))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) func $func-empty)
    (func $func-empty)
    (func $nested-br-ifs (param i32 i32 i32)
      (block
        (br_if 0 (i32.eqz (local.get 0)))
        (br_if 0 (i32.eqz (local.get 1)))
        (call_indirect (type 1) (local.get 2) (i32.const 0))
      )
    )
  )
  "type mismatch"
)