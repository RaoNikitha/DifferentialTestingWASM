;; 5. Design an `if` block with a valid initial condition, followed by sequences of nested `loops` and `blocks` where improper exit or branching mistakes inside these can lead to an `unreachable` instruction being reached incorrectly.

(assert_invalid
  (module (func $nested-loop-if (result i32)
    (if (result i32) (i32.const 1)
      (then
        (loop $loop1 (result i32)
          (block $block1 (result i32)
            (if (result i32) (i32.const 1)
              (then 
                (loop $loop2 (result i32)
                  (block $block2 (result i32)
                    (br $block1 (i32.const 1)) 
                    (unreachable)
                  )
                )
              )
              (else (i32.const 0))
            )
          )
        )
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)