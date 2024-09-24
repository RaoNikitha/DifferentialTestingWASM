;; 10. Create a nested loop structure where the continuation of the loop, decided by a `br_if` condition, immediately follows a `nop` instruction. Validate the loop's behavior to see if it terminates or continues under the same conditions in both engines.

(assert_invalid
  (module 
    (func $nested-loop
      (block $loop_block
        (loop $inner_loop
          (nop)
          i32.const 1
          br_if $inner_loop
        )
      )
    )
  )
  "loop structure validation"
)