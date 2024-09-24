;; 8. **Crossing Blocks and Ifs:**    Utilize a series of `block`, `if`, and `loop` structures interleaved, then place a `br` intending to cross several control structures. The goal is to verify proper handling of label resolution across mixed control constructs.

(assert_invalid
  (module
    (func
      (block
        (if (then
          (loop
            (br 3)
          )
        ))
      )
    )
  )
  "invalid label"
)