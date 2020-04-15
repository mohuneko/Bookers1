class BooksController < ApplicationController

  def new
  	#Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  	@book = Book.new
  end

  def top
  end

  def create
  	# 質問メモ
  	# 2) 投稿のテスト 一覧画面のテスト 投稿処理に関するテスト 投稿に失敗する
  	# title または bodyが空の場合はエラーを表示して登録していないのにエラー出ちゃってる。

  	@book = Book.new(book_params)
  	if @book.save
  		flash[:message]= "successfully"
	  	redirect_to book_path(@book.id)#詳細画面へリダイレクト
	else
	    @books = Book.all.order(id: "DESC")
  	    render :index
	end
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		flash[:message]= "successfully"
		redirect_to book_path(@book.id)
  	else

  	# 質問メモ
  	# 3) 投稿のテスト 編集画面のテスト 更新処理に関するテスト 更新に失敗しエラーメッセージが表示されるか
  	# 更新失敗した時のエラーの出し方がわからない、
  	# errors.anyはリダイレクトすると表示できないのでeditをrenderしたい
  	# その時に入力内容が保持できなかったり、リンク先がうまくできない。

	  	#book = Book.new(book_params)
		#redirect_to edit_book_path(book.id)
		render "edit"
	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy #削除
  	redirect_to books_path #booksへリダイレクト
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  	end

end
