;; 8. Test a `block` within a `loop` with several nested `if-else` constructs, using `br` to target the starting point of the outer block. Ensure that operand stack unwinding and restoration are handled correctly. Constraints checked: proper branch target identification, stack management.

(assert_invalid
  (module
    (func $nested_blocks (block (loop (block (if (i32.const 0) (then (br 2)))))))
  )
  "unknown label"
)