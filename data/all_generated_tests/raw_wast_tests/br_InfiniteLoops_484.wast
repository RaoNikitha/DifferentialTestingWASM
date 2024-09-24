;; 5. A test where `loop` has a `br` that targets a `block` defined outside the loop, ensuring that the `block` is exited correctly without re-entering the loop. This examines proper forward branch behavior and stack unwinding when faced with complex structured instructions.

(assert_invalid
  (module
    (func $loop-block-test
      (block $outer
        (loop $inner
          (br $outer) ;; Attempt to break out of the block from inside the loop
        )
      )
    )
  )
  "unknown label"
)