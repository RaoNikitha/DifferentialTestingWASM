;; 7. **Test Description**:    A test featuring a deeply nested control flow graph where each level has `nop` instructions will be prepared to ensure control flow graph traversal remains accurate regardless of these no-operation instructions.

(assert_invalid
  (module
    (func $deep-nest
      (block (loop (if (then (block (loop (if (then (block (loop (if (then (block (loop (nop)))))))))))))))
    )
  )
  "unreachable code"
)