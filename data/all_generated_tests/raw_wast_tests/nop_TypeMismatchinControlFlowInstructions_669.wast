;; Use multiple sequential `nop` instructions within a `block` that incorporates type-producing instructions, ensuring that the overall structure's stack type expectations get distorted, and validate if wizard_engine correctly flags a type mismatch condition.

(assert_invalid
  (module (func $stack-distort (block (nop) (nop) (i32.const 0) (nop) (nop) (i32.const 0) (i32.add) (nop) (nop) (i32.add) (nop) (nop))))
  "type mismatch"
)