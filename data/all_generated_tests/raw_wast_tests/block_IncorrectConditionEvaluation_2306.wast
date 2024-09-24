;; 7. Create a `block` that relies on a variable checked with `br_if`, manipulating the variable's value within the `block` and `instr*` sequence to validate the correct condition handling.

(assert_invalid
  (module (func $type-break-var-br_if (result i32)
    (local i32)
    (block (result i32)
      (local.set 0 (i32.const 1))
      (br_if 0 (local.get 0))
      (local.set 0 (i32.const 2))
      (local.get 0)
    )
  ))
  "type mismatch"
)