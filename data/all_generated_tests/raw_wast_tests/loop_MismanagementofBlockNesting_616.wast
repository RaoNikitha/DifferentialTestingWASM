;; 7. **Incorrectly Nested End for Loops**: Create a test where the `end` keyword for an inner loop is misaligned, causing it to close an outer loop. This evaluates the robustness of nesting validation logic in handling well-nested structures—a crucial point for differential behavior.

(assert_invalid
  (module
    (func $incorrectly-nested-end
      (loop $outer (block $inner (loop (br $outer)))
        end
      )
    )
  )
  "unexpected end"
)