;; Create a deep nested structure with multiple `if` constructs and place `unreachable` after a `br_if` that condition evaluates to false. Verify that any incorrect condition evaluation doesn’t bypass the trap.

(assert_invalid
  (module (func $deep-nested-if-unreachable-trap
    (block (result i32)
      (if (i32.const 0) (then (if (i32.const 1) (then (br_if 1 (i32.const 1)))))
      (else (unreachable) (i32.const 1))
    )
    (drop))
  )
  "type mismatch"
)