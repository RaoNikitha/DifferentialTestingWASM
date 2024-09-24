;; Use a `loop` containing a `block` with a `br` targeting the `loop`. This test examines if the branch skips the `block` and correctly jumps back to the start of the `loop`.

(assert_invalid
  (module
    (func $test
      (loop (block (br 1) (unreachable)))
    )
  )
  "type mismatch"
)