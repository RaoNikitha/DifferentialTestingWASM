;; 10. Develop a mixed sequence of blocks, loops, and inline function calls, with a `br` instruction targeting a mid-level block. Check if the relative label indices correctly resolve without slipping into control structures influenced by inline calls.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (block
          (loop
            (block
              (br 2)))))))
  "type mismatch"
)