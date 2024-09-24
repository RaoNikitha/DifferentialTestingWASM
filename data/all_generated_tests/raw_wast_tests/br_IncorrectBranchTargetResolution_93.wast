;; 4. **Forward Branch to If Block Test**: Create a program where a `br` instruction inside a loop incorrectly attempts to branch forward to an `if` block's label. Verify that the branch instruction correctly identifies the reachable and valid target blocks, maintaining structured flow integrity.

(assert_invalid
 (module
  (func $test
   (loop $loop_label  ;; L0
    (if (i32.const 1)  ;; L1
     (then
      (br 1)  ;; Incorrectly attempting to branch forward to the `if` block's label
     )
    )
   )
  )
 )
 "type mismatch"
)