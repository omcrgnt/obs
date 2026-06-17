.PHONY: gen test clean build

# Установка генератора в систему
build:
	go install ./cmd/obsgen

# Генерация кода для тестов
gen: build
	go generate ./tests/...

# Запуск тестов
test: gen
	cd tests && go test -v .

# Очистка сгенерированных файлов
clean:
	find . -name "*_obs_gen.go" -delete
