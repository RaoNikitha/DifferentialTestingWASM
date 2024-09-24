;; 7. Use a forward `br` instruction within a `loop` targeting a `block` outside the loop, ensuring that the instruction does not accidentally re-enter the loop, preventing unintended infinite looping.

(assert_invalid
  (module
    (func $invalid-forward-br-out-of-loop
      (block
        (loop
          (br 1)
        )
      )
    )
  )
  "forward br targeting block outside loop"
)