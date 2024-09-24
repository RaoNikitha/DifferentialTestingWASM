;; Sure, here are the test descriptions for differential testing focusing on incorrect branch target resolution with respect to the `unreachable` instruction:  1. **Test Unreachable in Loop Body with Forward Branch:**    - Insert `unreachable` inside a loop body and use a `br` instruction targeting a block defined after the loop.    - *Constraint*: Verifies if the branch resolution jumps out of the loop correctly instead of entering unintended code.    - *Relation to Branch Resolution*: Exposes issues with forward branch target resolution.

(assert_invalid
  (module (func $unreachable-in-loop-with-forward-br
    (block $b1
      (loop $l1
        (unreachable)
        (br $b1)
      )
    )
  ))
  "unreachable instruction leading to invalid branch target resolution"
)