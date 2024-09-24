;; 9. Test `br_if` within nested control structures and varied operand stack types, where non-i32 operands precede the condition. This ensures the `wizard_engine` accurately decodes the stack top for the `br_if` condition check.

(assert_invalid
  (module (func $nested-br_if
    (block (block (br_if 1 (i32.const 1) (i64.const 0))))
  ))
  "type mismatch"
)